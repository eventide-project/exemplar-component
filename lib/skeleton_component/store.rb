module SkeletonComponent
  class Store
    include EntityStore

    category :skeleton
    entity Skeleton
    projection Projection
    reader MessageStore::Postgres::Read
  end
end
