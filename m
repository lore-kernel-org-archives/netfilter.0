From: <bmcdowell@coxhealthplans.com>
Subject: RE: [2:656]?
Date: Mon, 6 Jun 2011 19:59:03 +0000
Message-ID: <92A9C99A1E5FF14F8538DDEE14996A52033470@chp-exg.coxhp.com>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
 <4DED3141.9030805@kickstone.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DED3141.9030805@kickstone.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: john.lister@kickstone.com
Cc: netfilter@vger.kernel.org

Well, that explains why I couldn't search for it!  HA!

Thanks mucho.


Bob McDowell
Network/Security Engineer 
Cox HealthPlans 

-----Original Message-----
From: John Lister [mailto:john.lister@kickstone.com] 
Sent: Monday, June 06, 2011 2:58 PM
To: Bob McDowell
Cc: netfilter@vger.kernel.org
Subject: Re: [2:656]?

On 06/06/2011 20:35, bmcdowell@coxhealthplans.com wrote:
> Hello list.  I'm in the process of 'modernizing' my iptables scripts to utilize iptables-save/iptables-restore.  I've imported my script onto a test box, have exported via -save, and now I have a question or two about what I'm seeing. 
>
> For starters, is there a reference for the changes in format?  Google is most unhelpful when trying to search for "[2:656]", for example.
>
> Specifically, I'd like to know what the "2:656" means in the following line:
>
> -----
> *filter
> :INPUT DROP [2:656]
> -----
These are the packet/byte counts for that chain from memory - You can 
simply replace them 0:0 if you are generating scripts and don't care 
about the counts.

John
