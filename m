From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: simple error in extensions/libipt_ROUTE.c
Date: Thu, 20 Jun 2002 16:30:27 +0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <ZWYXC9KGRLXLKB676ON62KFZX93FDDC.3d11bcd3@ALEXEY>
Reply-To: alexey_talikov@texlab.com.uz
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org
Cc: delaunois@info.ucl.ac.be

in extensions/libipt_ROUTE.c
line 60 and 77
also change " if (check_inverse(optarg, &invert)) " to
"  if (check_inverse(optarg, &invert, NULL, 0))  "


-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------







