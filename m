From: =?ISO-8859-15?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Subject: Re: Setup of different types of NAT
Date: Fri, 20 Apr 2007 09:43:05 +0100
Message-ID: <46287D19.4000004@gmail.com>
References: <4625E078.1020301@gmail.com> <4627C7BF.5000406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4627C7BF.5000406@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>


>> I want to know *how to* setup this types of NAT:
>> /-Full Cone NAT/
>> /-Restricted Cone NAT/
>> /-Port Restricted Cone NAT/
>> /-Symmetric NAT/
>
> Again ? I thought I already answered the last time you asked.
I couldn't solve the problem with the help you gave, so I had to try it 
once again.
Besides, the last time I talked about types of NAT some people said it 
was possible to create those NATs, others said it was impossible, but no 
one told *how to* implement any kind of NAT.

>> Using iptables, I set all policies to "ACCEPT" and I was able to 
>> setup two kinds of NAT:
>> (192.168.2.170 is my "public" address and 10.0.0.1 is my "private" 
>> address
> [...]
>> /-"Port Restricted Cone NAT", with just a single rule:/
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
>> 192.168.2.170/
>
> This is "symmetric NAT", not "restricted cone NAT".
At least with the version of Iptables I have (1.3.0), all STUN clients I 
tried told me that it was a "Port Restricted Cone NAT"

>
>> Now does anyone know how to setup Restricted Cone NAT and Symmetric NAT?
>
> AFAIK, you cannot do "restricted cone NAT" nor "port restricted cone 
> NAT" with the stock Netfilter/iptables. It would require dedicated 
> conntrack and NAT helper modules.
At least with the version of Iptables I have (1.3.0), I can implement 
"Port Restricted Cone NAT" with just one rule and I can implement an 
"hardcoded" "Restricted Cone NAT" (I say it's hardcoded because It only 
works for one host behind NAT).

So, as you can see, we disagree in our opinions.
However, if you want to test your NAT types with STUN, I recommend 
JSTUN's client (http://jstun.javawi.de/).

Best Regards
Pedro

