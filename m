From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Performance losings with iptables
Date: Tue, 20 May 2003 18:09:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030520100926.GA1209@floyd>
References: <007d01c31965$fe099ce0$3a51a8c0@memmingen> <1053417001.1964.86.camel@kermit.spenneberg.de>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1053417001.1964.86.camel@kermit.spenneberg.de>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Tue, May 20, 2003 at 09:50:01AM +0200, Ralf Spenneberg spoke thusly:
>Am Die, 2003-05-13 um 17.40 schrieb Michael Albrecht:
>> iptables -A input -s 192.168.81.xxx 
>> i will lose a lot of perfomance (for
>> example: apache take a lot of time, ssh ...) Wenn i show the perfomance
>> with vmstat - vmstat says that 99 % is

As Michael has already mentioned, I too doubt its an iptables fault. I've
had in excess of 1,300 rules running on a production firewall, for dynamic
dumping of Nimda infected hosts. Its almost certainly a name resolving
issue as Michael has already pointed to.

