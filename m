From: "hareram" <hareram@sol.net.in>
Subject: Re: Logging suggestions
Date: Wed, 13 Apr 2005 10:38:59 +0530
Message-ID: <0b3501c53fe6$e682ffe0$09603fca@southern>
References: <0aa401c53f73$5c19a2a0$09603fca@southern>
	<20050412161134.GA5964@epsilon.rdc.pl>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Mariusz Kruk <Kruk@epsilon.eu.org>, netfilter@lists.netfilter.org

Hi

thanks for the
Suggestions

can you point me to how can loggin only new connections
any docs or examples will be helpfull

hare
----- Original Message ----- 
From: "Mariusz Kruk" <Kruk@epsilon.eu.org>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, April 12, 2005 9:41 PM
Subject: Re: Logging suggestions


> On Tue, Apr 12, 2005 at 08:51:54PM +0530, hareram wrote:
>> I have large  capacity link like STM with my provider
>> Iam planning to log the every packet, source IP , Dest IP, Src port, Dest
>> port , Type of Service
>> what kind of system configuration recommended
>
> First of all, I would advise to think if you really really need the
> logging of every packet that badly. Perhaps only logging new
> connections would be sufficient. Otherwise you'll generate huge amounts
> of data. Especially, if your link is quite full.
>
> -- 
> /\-\/\-\/\-\/\-\/\-\/\-\/\ Irrelevant  proper  order  of words is, yes.
> \  Kruk@epsilon.eu.org   / Yoda of Borg
> / http://epsilon.eu.org/ \
> \/-/\/-/\/-/\/-/\/-/\/-/\/
>
>
> 



