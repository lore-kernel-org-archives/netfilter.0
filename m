From: Jason Opperisano <opie@817west.com>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 17:29:32 -0500
Message-ID: <20050202222932.GA1803@bender.817west.com>
References: <186AC876521E0F46BDE77079A6567FD0F0DD97@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <186AC876521E0F46BDE77079A6567FD0F0DD97@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Feb 02, 2005 at 02:22:41PM -0800, Hudson Delbert J Contr 61 CS/SCBN wrote:
> jason,
> 
> sorry, but your gonna' hear this anyway...but its not negative..
> i just wanna know why?
> 
> okay...here is what i'm sure will think is a dumb question.
> 
> why not make life simple for all concerned [servers, clients and routers, too...]
> 
> re-numbering the subnets...or just one and --- voila! problem gone   !!!!
> 
> this might be too simplistic for this list (he! he! he!) but lets say...
>  
> eth0@server = 192.168.100.0/24 
> eth0@client = 192.168.100.1/24
> 
> eth1@server = 172.16.1.0/24 
> eth1@client = 162.16.1.1/24
> 
> or whatever...whats the problem?
> 
> i think also the statement below may be have some validity
> if this is as easy as i think it is.
> 
> where's the difficiulty.
> 
> complex is bad.
> simple is good.

i agree with you one hundred thousand gabillion (is that a
glavin?) percent.  judging from the posts in this thread--i believe
properly configuring IP is an unacceptable solution for the OP.

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
        --The Simpsons

