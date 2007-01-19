From: "saspan" <saspan@web.de>
Subject: Re: redirecting on a local machine
Date: Fri, 19 Jan 2007 20:48:37 +0100
Message-ID: <009901c73c02$d046cad0$0700a8c0@stormbook>
References: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
	<45B11AF9.8060209@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

From: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>

>> iptables -t -nat -A OUTPUT -m owner ! --owner-uid squid -p tcp --dport 
>> 80 -j REDIRECT --to-destination 3128
>
>'--to-destination' is not a valid option for REDIRECT. The only valid 
>option is '--to-ports'.

Sorry, sure, that is what it actually looked like. 
I pasted the code quickly from my memory.
The rule I used was

iptables -t -nat -A OUTPUT -m owner ! --owner-uid squid -p tcp --dport 
80 -j REDIRECT --to-ports 3128

>> doesn't seem to work,
>
>That does not provide much info. Can you elaborate ?

The browser sends http-request, it is redirected to squid
and then network-timeout-error occurs in the browser .

>> cause a browser would not be expecting a reply 
>> from a transparent proxy when waiting for replies to its requests.
>
>Huh ?

See: 
The browser sends http-request to e.g. 99.9.9.9.1:80.
The request is redirected to proxy on 127.0.0.1:3128.
Browser waits for reply from 99.9.9.9:80.
Actually the reply will come from proxy on 127.0.0.1:3128.

Do you see the problem?

Regards

Sascha



