# Nessie Server Admin Tool

 ## Problem
 - Nessie operates like Git, storing data through a commit mechanism.
 - When we use Nessie as a catalog for Iceberg, it's stored in a PostgreSQL database. After about two months, this database (~100GB) ran out of space. We weren't aware of what it was storing to grow so large. 
 
## The Nessie Server Admin Tool to perform repository maintenance tasks such as:
- Obtaining information about a Nessie repository;
- Exporting a Nessie repository to a ZIP file, e.g. to create a backup;
- Importing a Nessie repository from a ZIP file, e.g. to restore a backup;
- Migrating from a legacy version store type.


## Usage
The Nessie Server Admin Tool requires direct access to the database used by Nessie. The executable is named nessie-server-admin-tool-x.y.z-runner.jar and can be downloaded from the [release page on GitHub](https://github.com/projectnessie/nessie/releases).

The Nessie Server Admin Tool nessie-server-admin-tool-x.y.z-runner.jar should use the same configuration settings as the Nessie Quarkus server. These settings should be passed to the tool using system properties, environment variables or a configuration file. The most relevant settings are those related to the [database connection](https://projectnessie.org/nessie-0-95-0/configuration/#version-store-settings).


## Refference
- [Project Nessie](https://projectnessie.org/nessie-0-95-0/export_import/)
