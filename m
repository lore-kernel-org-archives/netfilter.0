From: Nick <fenderflames@yahoo.com>
Subject: Re: FORWARD question
Date: Fri, 21 Nov 2003 02:42:39 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031121104239.37088.qmail@web40804.mail.yahoo.com>
References: <200311202312.hAKNC8723820@onyx.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311202312.hAKNC8723820@onyx.rockstone.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks Antony, I got it. Once nat and conntrack
helpers are implemented correctly, I don't have to
worry about it anymore :-)

There is one last thing, though(I promise it's the
last one ;-)

When I said that only port 21 is open I meant that on
the router machine only this port accepts NEW client
connections. The other ports will accept only
ESTABLISHED and RELATED. I defined this in my INPUT
rules. 

Do I need to accept NEW client connections to port 20
as well ? I know it's used for active FTP and I
thought FTP client never sends NEW to port 20, only
ESTABLISHED.

What do you think? I appreciate your help

__________________________________
Do you Yahoo!?
Free Pop-Up Blocker - Get it now
http://companion.yahoo.com/

