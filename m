From: Jason Opperisano <opie@817west.com>
Subject: Re: problem using MAC address.
Date: Wed, 27 Oct 2004 09:24:15 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098883454.3206.2.camel@hubcap.ljm.dom>
References: <20041027095016.39480.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041027095016.39480.qmail@web60408.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-10-27 at 05:50, ads nat wrote:
> Hi,
> I want block forwarding as follows :
> 
> "iptables -I INPUT 1 -i eth1 -p tcp -m tcp --dport 25
> -m mac --mac-source 00:08:A1:53:BE:71 -d ! 10.0.0.2 -j
> DROP"

if you're trying to block FORWARDING, why not try putting that rule in
the FORWARD chain instead of the INPUT chain?

> it does not work but when I try to do same thing with
> rule 
> "iptables -D FORWARD -i eth1 -p tcp -m tcp --dport 25
> -s 192.168.0.42 -d ! 10.0.0.2 -j DROP"

that is a command that deletes a rule out of the FORWARD chain

> Is there any sytax error.
> 
> Or Do I have to installed any additional module of
> iptables.
> I am using Redhat 9.0 Linux.
> Please guide me.

wanna clue us in as to what exactly you're trying to do?

-j

-- 
Jason Opperisano <opie@817west.com>


