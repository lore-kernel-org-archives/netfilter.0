From: Ryan L <drseus88@gmail.com>
Subject: Re: command owner match support
Date: Sat, 07 Jan 2006 10:58:36 -0600
Message-ID: <43BFF33C.9050304@gmail.com>
References: <43BCC326.4000302@gmail.com>
	<20060106133103.GF7546@metastasis.org.uk>
	<43BF214A.4050801@lists.netfilter.org>
	<20060107140410.GK7546@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060107140410.GK7546@metastasis.org.uk>
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

Nick Drage wrote:

>On Fri, Jan 06, 2006 at 08:02:50 -0600, drseus88@gmail.com wrote:
>  
>
>>Nick Drage wrote:
>>    
>>
>>>On Thu, Jan 05, 2006 at 12:56:38 -0600, Ryan L wrote:
>>>      
>>>
>
>Hi,
>
>  
>
>>I have found nothing about why it was removed or it should be replaced
>>with either. That is the main thing I'm trying to find out. The
>>message you get is the same as what I get when running the command in
>>console.  But if you check /var/log/messages right afterward, it will
>>show the message I posted. Sorry. I should have clarified that a bit
>>more. Also, I'm using iptables 1.3.4 with a 2.6.14 kernel.
>>    
>>
>
>It's very weird that it's just vanished.  Please post me this reply but
>to the mailing list just so everyone can see it, and then I'll send off
>an email to the developers, see if we can get a response.
>
>Thanks.
>
>  
>
Oh, did you mean like this?

Ok this is how it went in order:
> 1) Run: iptables -I OUTPUT -m owner --cmd-owner firefox -j LOG
> 2) It gives me this message: "iptables: Invalid argument"
> 3) Check /var/log/messages
> 4) It shows the following message:  "Jan 4 22:44:05 thor > ipt_owner: 
> pid, sid and command matching not supported anymore"
> 5) I say "WTF!?"



