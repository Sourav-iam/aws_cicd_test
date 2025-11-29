# Stage 1: Build the application
# Use the official .NET SDK image based on Ubuntu (e.g., 8.0-ubuntu)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy the project files and restore dependencies
# Use a wildcard to copy csproj files first to leverage Docker's build cache
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application code
COPY . .

# Publish the application in Release configuration
RUN dotnet publish -c Release -o out

# Stage 2: Run the application
# Use a minimal runtime image based on Ubuntu
# This image contains only the .NET runtime and necessary libraries
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Expose the port the application listens on (default for ASP.NET Core)
EXPOSE 8080

# Copy the published output from the build stage
COPY --from=build /app/out .

# Set the entry point to run the application
ENTRYPOINT ["dotnet", "AWS_CICD_Test.dll"]
