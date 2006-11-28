From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: RE: Passive FTP sees remote's _internal_ IP!!??
Date: Tue, 28 Nov 2006 13:09:48 -0500
Message-ID: <7211.43071209571$1164737475@news.gmane.org>
References: <456BBF32.877BE99C@iswest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <456BBF32.877BE99C@iswest.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'gypsy' <gypsy@iswest.com>, netfilter@lists.netfilter.org


> SonicWALL does fix this, and we also would REALLY like to know how!!  At
> the present time, our only "solution" is to reconfigure the clients to
> gateway to the SonicWALL because everyone's browser only does passive
> FTP.

I have an idea on how SonicWALL fix this, maybe it
is programmed to detect badly configured FTP replies
and correct them itself by replacing the PASV x.x.x.x
command with the source IP found in the IP packet

something like :

if ip.sourceIP != ftp.reply.passiveIP then
  ftp.reply.passiveIP = ip.sourceIP

I dont think iptables can do that, correct me if i'm wrong

I see you got a workaround, happy to hear this :)

Have a nice day

Maxime


