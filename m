From: Jason Frisvold <xenophage0@gmail.com>
Subject: Re: ulogd compile problems
Date: Thu, 10 Sep 2009 22:57:27 -0400
Message-ID: <E3DD2040-0751-44C2-94AA-9FA7D9DD0117@gmail.com>
References: <4F548017-89C1-42AE-87F1-68F92C62A8D4@gmail.com> <22C0D408-B9FD-4B04-9CD8-E077E45C7F3A@gmail.com> <4AA68560.1080006@unipex.it> <4AA6C913.504@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1075.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:mime-version
         :content-type:from:in-reply-to:date:cc:content-transfer-encoding
         :message-id:references:to:x-mailer;
        bh=idfQTX+Tm1cys660Mv3hsgK8ag4p7/rdrQMSOTj8tic=;
        b=E6y/EfyAaITcG6e7iGY4jq0aKmTqZFJTS4Cf1Np9M6ShQGjkqVvdTfN8jgJacmySbZ
         nfsmDM3LbttHfDZbUNTUVC+kN5t+ntLDDeipgBW7kdGssA3SC4ETWSJ4OonrYa8jTMSc
         6ksxNfkO9F/pxhdkNZIDTz3U6MS0xvvxmJU4I=
In-Reply-To: <4AA6C913.504@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Jason Frisvold <xenophage0@gmail.com>
Cc: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>, netfilter@vger.kernel.org

On Sep 8, 2009, at 5:13 PM, Jason Frisvold wrote:
> I did modify the makefile and change the -rdynamic flag to -rpath.  I
> compiled and it seems to run now, though I need to test more.


Ok, so a final update to explain what I did to get this to work.  If  
the developers can come up with a patch, then awesome.  If not, then  
I've included the patch to configure that I used to make this work.

To start, I'm running this on a CentOS 5.3 system with MySQL 5.0.67  
installed via RPMs.  I'm using the rhel5 RPMS.

If we run mysql_config --libs, we get the following output :

[user@example SPECS]$ /usr/bin/mysql_config --libs
-rdynamic -L/usr/lib/mysql -lmysqlclient -lz -lcrypt -lnsl -lm

There are two problems with this.  First, -rdynamic is not a linker  
flag and just ends with an error.  I believe this can be changed to - 
Bdynamic, which is a linker flag, or it can be deleted.  I chose the  
latter.

The second problem won't show itself until you try to start ulogd with  
the MySQL extension configured.  When you try to start ulogd, you get  
this :

Starting ulogd: Thu Sep 10 22:35:20 2009 <7> ulogd.c:462 load_plugins:  
'/usr/lib/ulogd/ulogd_MYSQL.so': /usr/lib/ulogd/ulogd_MYSQL.so:  
undefined symbol: mysql_fetch_field

The problem here is that libmysqlclient exists in /usr/lib, not /usr/ 
lib/mysql.  So, we need to add -L/usr/lib to the linker options.   
Adding this allows the extension to properly build, linking it with  
the proper libraries.

Also included in the patch below is a fix for the  
mysql_real_escape_string check.  I'm not sure what the exact aim is  
here, but I do know that the original method for checking failed  
miserably.  My fix uses "locate," though, which I don't believe is  
portable.

If someone has a better patch, please let me know.  I'd love to fix  
this the correct way, but I'm not that familiar with linker and  
compiler flags.

--- ./configure	2006-01-25 06:15:22.000000000 -0500
+++ ./configure	2009-09-10 22:37:24.000000000 -0400
@@ -1728,11 +1728,11 @@
  EOF

          MYSQLINCLUDES=`$d/mysql_config --include`
-        MYSQLLIBS=`$d/mysql_config --libs`
+        MYSQLLIBS=`$d/mysql_config --libs | sed s/-rdynamic//`

  	DATABASE_DIR="${DATABASE_DIR} mysql"

-	MYSQL_LIB="${DATABASE_LIB} ${MYSQLLIBS} "
+	MYSQL_LIB="${DATABASE_LIB} -L/usr/lib ${MYSQLLIBS}"
  	# no change to DATABASE_LIB_DIR, since --libs already includes -L

  	DATABASE_DRIVERS="${DATABASE_DRIVERS} ../mysql/mysql_driver.o "
@@ -1747,7 +1747,8 @@
  	echo $ac_n "checking for mysql_real_escape_string support""...  
$ac_c" 1>&6
  echo "configure:1749: checking for mysql_real_escape_string support"  
 >&5

-	MYSQL_FUNCTION_TEST=`strings ${MYSQLLIBS}/libmysqlclient.so | grep  
mysql_real_escape_string`
+   LIBMYSQLCLIENT=`locate libmysqlclient.so | grep libmysqlclient.so$`
+   MYSQL_FUNCTION_TEST=`strings $LIBMYSQLCLIENT | grep  
mysql_real_escape_string`

  	if test "x$MYSQL_FUNCTION_TEST" = x
  	then


Thanks!

-- 
Jason 'XenoPhage' Frisvold
XenoPhage0@gmail.com
http://blog.godshell.com

