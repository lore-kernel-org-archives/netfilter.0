From: "per jarevez" <perj8@hotmail.com>
Subject: RE: block downloads on file type
Date: Wed, 23 Apr 2003 23:50:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F3BRArVc4Iu1B600000750@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daves@xetron.com, netfilter@lists.samba.org
Cc: netsnake@963.net

Hi,

You can use Squid Cache + [content filtering ] + Apache mod_proxy + 
RewriteMap in mod_rewrite + your own script to process requests passed to it 
from RewriteMap + Netfilter + IPRoute2 Traffic Control (TC tool).

Or just [content filtering] + Apache mod_cache + mod_proxy + mod_rewrite + 
Netfilter + TC Tool.

You can also use Snort + [ snortSnaf, etc. ] + Netfilter + TC tool.

Or you can use hogwash + TC tool.

I don't know if you can do it just with Squid + IPTables as he mentioned, 
but I'm sure you eventually gonna want to use a traffic shaper (TC tool) 
somewhere.

Just to tell ya that if you are doing it to slow down those downloads, might 
as well post up a user policy that they are responsible for their own 
bandwidth usage and just do IPRoute2 traffic shaper and a suitable Qdisc to 
fair share available bandwidth among people on your network.  A lot less 
hassle and less bugs / security problems.

Good luck.

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


