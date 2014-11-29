module Paths_harmlang (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/h/ccousi01/.cabal/bin"
libdir     = "/h/ccousi01/.cabal/lib/x86_64-linux-ghc-7.8.3/harmlang-0.1.0.1"
datadir    = "/h/ccousi01/.cabal/share/x86_64-linux-ghc-7.8.3/harmlang-0.1.0.1"
libexecdir = "/h/ccousi01/.cabal/libexec"
sysconfdir = "/h/ccousi01/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "harmlang_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "harmlang_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "harmlang_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "harmlang_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "harmlang_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
