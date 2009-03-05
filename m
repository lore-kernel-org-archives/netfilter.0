From: dstorvik <dstorvik@consultech.net>
Subject: ULOGD: Log file size limitation?
Date: Thu, 5 Mar 2009 10:36:40 -0500
Message-ID: <F5E47532014E8E45A339717AF42215342F2B942C49@hild.consultech.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have ulogd running to track netfilter nat connections.  When my log file reaches 2147483647, exactly 2 gb it stops writing with no errors or warnings.  It then picks back up when logrotate rotates the file and kicks ulogd.  I am rotating daily so other than rotating on an intraday period, which I'd rather not do, I'm not sure what to do.   The file system is a Logical volume group with EXT3 filesystem, and I believe 1K blocks which should lead to a maximum file size of 16 Gigabytes from what I understood. Is that not true and I simply have a file system problem or is this some limitation or bug in ULogd?

Thanks
   Derek

