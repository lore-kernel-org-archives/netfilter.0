From: jpiszcz <jpiszcz@lucidpixels.com>
Subject: Re: using ip_nat_ftp
Date: Fri, 14 Feb 2003 08:29:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E4CEF2A.2040702@lucidpixels.com>
References: <46338.80.26.113.199.1045142920.squirrel@www.clientes.sedifa.com> <49309.80.26.113.199.1045228632.squirrel@www.clientes.sedifa.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Albert Cervera Areny <informatic@sedifa.com>
Cc: netfilter@lists.netfilter.org

I have it statically compiled in, (may not be the most useful this way), 
but it works for me.
 From inside your lan, ftp gnu.org and port mode should work.
Keep in mind when you ftp somewhere the default is just to allow port 21 
(w/ connection tracker), if you want more ports, the module/kernel boot 
line takes arguments to specify up to 7 additional ports, so 8 ports total.


Albert Cervera Areny wrote:

>It seems that my firewall is what makes ip_nat_ftp not usefull. Could
>someone tell me how should I configure the firewall to enable ftp client
>requests?
>
>  
>
>>Hi,
>>  I'm trying to use ip_nat_ftp but I don't know if it is necessary to do
>>anything else apart from loading the ip_nat_ftp module. I've tried to
>>load it but can't access properly to ftpav.ca.com unless I use passive
>>mode. It wouldn't be a problem if eTrust supported ftp access with
>>passive mode :(
>>
>>  Thanks for any help!
>>
>>
>>
>>    
>>
>
>
>
>
>  
>



