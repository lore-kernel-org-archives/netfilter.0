From: Stephane Ouellette <ouellettes@videotron.ca>
Subject: Re: How to find nvl table?
Date: Tue, 15 Apr 2003 04:11:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E9BBECF.3030302@videotron.ca>
References: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: Bobo <boboaq@163.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Bobo wrote:

>HI
>
>     Some days ago ,a member of here reply me the followings about traffic account:
>  
>
>>try this one:
>>
>>iptables -nvL INPUT
>>
>>in Perl:
>>
>>open(CHAINS, "iptables -nvL INPUT|") or die "Error reading chains\n";
>>
>>while(<CHAINS>)
>>{
>># read the lines one by one, matching on the text you want
>>}
>>
>>close(CHAINS);
>>    
>>
>
>   My platform is Redhat 7.2 in  default congiguration.
>
>  While I execute "iptables  -nvL input"
>  
>

Table names are case sensitive. Use INPUT, not input :-)

>  I got the following message on screen:
>
>
>   [root@myfirewall account]# iptables -nvL  input
>iptables: Table does not exist (do you need to insmod?)
>
>    why?  how to find the talbe? does  it need a special patch?
>
> Thanks.
>
>
>  
>




