From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: block ping  ?
Date: Sat, 10 Apr 2004 22:50:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040410205054.GA34633@jesus.seclab.jp>
References: <006301c41f3a$19f04f00$0300000a@serverxx>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006301c41f3a$19f04f00$0300000a@serverxx>
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
To: Syed Faisal Gillani <faisal@clickonlinenetworks.com>
Cc: netfilter@lists.netfilter.org

On Sun, 11 Apr 2004, Syed Faisal Gillani wrote:

> i am a newbie learning iptables ...
> can u tell me the rule of blocking only ping on my nic ?

Hi,

try this:

iptables -A INPUT -p icmp --icmp-type echo-request -j DROP to block incomming pings

Anyway, remember that blocking pings  is the best way to tell everyone
"Hey dudes, I have something to protect, come in now!"

regards
Frederic
--
< Ylli> lol je rigole neuro jte prend pa pr un pervers ms un president
et pere de famille respectable :s
http://www.seclab.jp

