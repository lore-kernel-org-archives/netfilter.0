From: Eric Constantineau <mekanik@nerim.net>
Subject: passive mode ftp
Date: Fri, 23 May 2003 10:56:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ECDE243.3133BBAA@nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi !

I want to be able to use passive ftp under my firewall...

Right now passive mode does not function because I allow only packets
WITH port 21 as a destination OR source.  When in normal mode, packets
from the ftp server have 21 for the source port and the packets from the
client have 21 for the destination port so it works.  But, entering
passive mode, the destination and source ports are not 21, so my
firewall blocks.

Using a ftp client such as leechftp, cuteftp, wsftp is okay, but using
the browser (iexplore) does not because it use passive mode.

I don't want to open too much my ports, it would mean that someone could
use those ports to get access to inside networks...  But I want to be
able to use passive mode, some users do not want to use ftp client
software, or are not even able to install them...

Is there a specific range of ports that all passive ftp use ?

Thanks for helping me

Eric




