From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: Classifying W32/MyDoom.A
Date: Thu, 29 Jan 2004 21:41:01 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4019EE6D.2020306@smgtec.com>
References: <3383379105910242B6F8878D41FA834201A7B5@glsql.greatlakes.net> <1075441566.1999.114.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010601050702010401090809"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075441566.1999.114.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------010601050702010401090809
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Netfilter is not an application layer Firewall.

Try something like sendmail/Mailscanner and pick up clamav. I was 
blocking before I even knew about the virus!


Ray Leach wrote:

>On Thu, 2004-01-29 at 20:06, Eliot, GLI wireless tech support wrote:
>  
>
>>Has anyone come up with a ruleset for classifying a random TCP or
>>specific SMTP connection as being the W32/MyDoom.A virus?
>>    
>>
>
><<snip>>
>
>  
>
>>Anyone have any ideas how to do this without too many false positives?
>>(IE a document on the web that describes the characteristics of
>>MyDoom.A). 
>>    
>>
>
>Since it spreads via SMTP from clients and not servers, why not just
>block all smtp traffic outbound to the internet from your client
>machines, and only allow your mail server to send smtp mail?
>
>Of course you would need a decent anti-virus program on the mail server.
>
>The other way you could possibly do this is by using a string match to
>look inside any smtp packets for matches of the attachment names(?).
>
>  
>

--------------010601050702010401090809
Content-type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Netfilter is not an application layer Firewall.
Try something like sendmail/Mailscanner and pick up clamav. I was blocking before I even knew about the virus!
Ray Leach wrote:
On Thu, 2004-01-29 at 20:06, Eliot, GLI wireless tech support wrote:
Has anyone come up with a ruleset for classifying a random TCP or specific SMTP connection as being the W32/MyDoom.A virus?
<<snip>>
Anyone have any ideas how to do this without too many false positives? (IE a document on the web that describes the characteristics of MyDoom.A).
Since it spreads via SMTP from clients and not servers, why not just block all smtp traffic outbound to the internet from your client machines, and only allow your mail server to send smtp mail? Of course you would need a decent anti-virus program on the mail server. The other way you could possibly do this is by using a string match to look inside any smtp packets for matches of the attachment names(?).

--------------010601050702010401090809--

