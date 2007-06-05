From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Restricting applications/protocols to use specific ports using
	iptables, is this possible
Date: Tue, 5 Jun 2007 19:42:56 +0200
Message-ID: <20070605174256.GE658@torres.zugschlus.de>
References: <1814bfe70706040437i34b282d8ocf15b698160e05b5@mail.gmail.com>
	<20070604120611.GC28171@torres.zugschlus.de>
	<1814bfe70706040539x61ca3113rb8679da3cc29b304@mail.gmail.com>
	<4665889E.2030201@vlsmaps.com>
	<1814bfe70706051000j42f785fcv14789482cc77f0c7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1814bfe70706051000j42f785fcv14789482cc77f0c7@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jun 05, 2007 at 07:00:31PM +0200, Elvir Kuric wrote:
> Hi all,  I realised that I did not ask question on right way in my
> last mail to this list. I am trying to find  out some tool or whatever
> else to open in input and output chain only ports I need, I mean to
> control which ports are open.
> In other words to have evidence which ports are open and why. Maybe
> this is funny for more experience users, but I asked this question
> here because I thought that iptables can help / and maybe can, but I
> do not know that :).

Netfilter can help you here, but if I wanted to learn, I'd use tcpdump
and/or wireshark. An "ACCEPT and log" rule in iptables might help as
well.

Generally, the port from which a connection originates does only
matter in exceptional cases.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221 2323190

