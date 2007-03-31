From: Arnd-Hendrik Mathias <arnd-hendrik.mathias@nefkom.net>
Subject: Re: Droping all SYN
Date: Sat, 31 Mar 2007 17:01:29 +0200
Message-ID: <460E77C9.3060400@nefkom.net>
References: <20070327151521.371d4312@notebook.chaosbringer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070327151521.371d4312@notebook.chaosbringer.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hey Julian,
I'm not sure if I get your question right but it sounds like

iptables -A FORWARD -d 192.168.1.4 -o vif1.0 -p tcp -m conntrack --ctstate NEW -j DROP

Have you checked this out?
Greetz

Arnd-Hendrik

Julian Hagenauer wrote:

>Hi,
>this may be a simple Question.
>I have a xen-domain which is acting as a server.
>For some experiments i want, that every attempt to connect to a services on this server is blocked, but none of the existing connections is affected. 
>So, the ip of the server is 192.168.1.4 and the interface on dom0 is vif1.0. Dom0 acts as a arpproxy.
>Would 'iptables -A FORWARD -d 192.168.1.4 -o vif1.0 -p tcp --syn -j DROP' enough?
>
>Its crucial for me, so i have to be sure that the syntax is correct.
>
>Thanks,
>Julian
>
>
>
>  
>

