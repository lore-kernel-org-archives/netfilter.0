From: Lukas Ruf <ruf@maremma.ch>
Subject: Re: Clear Iptables chains?
Date: Mon, 8 Jul 2002 16:46:58 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708144658.GR32764@tik.ee.ethz.ch>
References: <839BF5387528D311AD5D00902751CFC301B0419A@HAVASSMX>
Reply-To: Lukas Ruf <ruf@maremma.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <839BF5387528D311AD5D00902751CFC301B0419A@HAVASSMX>
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
To: Denis JULIEN <denis.julien@vupublishing.net>
Cc: netfilter@lists.samba.org

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X

but rtfm.

--lpr

On Mon, 08 Jul 2002, Denis JULIEN wrote:

> How can I clear all iptables chains before that my FW script be launched?
> 
> thank in advance
> 
> Denis
> 

-- 
Lukas Ruf      Bellariastr. 11      CH-8002 Zuerich      +41 1 2813545
http://www.lpr.ch                                http://www.maremma.ch    
     http://www.{{topsy,nodeos}.net,{promethos,netbeast}.org}

