From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 22:54:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920215417.UBMV295.mta06-svc.ntlworld.com@there>
References: <000501c260ec$0cb7ddc0$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c260ec$0cb7ddc0$0801a8c0@s3ac>
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
To: netfilter@lists.netfilter.org

On Friday 20 September 2002 10:24 pm, Rowan Reid wrote:

> http://www.e-infomax.com/ipmasq/howto/examples/rc.firewall-2.4-stronger
>
> My firewall ruleset is a slight modification of the above link.

From what you have said so far, I don't think your ruleset is the problem 
(except possibly for a certain misunderstanding about the difference between 
INPUT and FORWARD chains...?).

I just had a look at that ruleset, and I'm very surprised at the use of 
$UNIVERSE all over the place - as I mentioned in a previous mail in this 
thread, it is quite redundant no matter where it appears (in other words, 
leaving it out of any rule creates precisely the same meaning, and is 
generally easier to understand), and in several of the examples where it 
appears it is actually rather pointless, eg:

iptables -A INPUT -s $somewhere -d $universe -j DROP

There is absolutely no purpose in having $universe (= 0.0.0.0/0) in such a 
rule.


I think the problem is your physical network setup - you should not have a 
direct link between the internal and external interfaces of your firewall.

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

