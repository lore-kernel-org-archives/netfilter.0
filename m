From: "Admin" <admin@romexpo.org>
Subject: Re: Re: selective filter
Date: Thu, 4 Dec 2003 08:41:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002a01c3ba31$9d1a82b0$0501a8ac@Rares>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Yesterday I posted a message regarding a selective filter.
I was asking for a hands on making a filter which will force only some users
to use the squid proxy and some not.
The message can be found in "netfilter digest, Vol 1 #1355" with the subject
"selective filter".
First of all I want to thank you to Antony Stone
<Antony@Soft-Solutions.co.uk> that replyed me on the list with a very
helpfull instruction.
And, because his wish was not to reply directly to him, I came with a
suplementary question related to that message:
After I do this:

iptables -A FORWARD -s 192.168.1.21 -p tcp --dport 80 -j ACCEPT
....
iptables -A FORWARD -p tcp --dport 80 -j REJECT

this mean that all the rules aplies to the running configuration?
I mean, if I restart the service iptables I will have to write those rules
again?
To save the rules and to make them load after a service restart I have to
type "service iptables save"?
If the answer to the questions above is negative, I want to know what can I
do to REMOVE the rules?
Thank you in advance.

R.



