From: Umut Arus <umuta@sabanciuniv.edu>
Subject: Re: Limiting httpd traffic
Date: Sat,  5 Jan 2008 13:50:10 +0200
Message-ID: <20080105135010.35aw2zq1biroogg8@webmail.sabanciuniv.edu>
References: <20080105022544.99knia1nqesgkw48@webmail.sabanciuniv.edu>
	<Pine.LNX.4.58.0801051108580.32055@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0801051108580.32055@mail3.jubileegroup.co.uk>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org

Hi,

I mean that "http outgoing traffic". rapidshare connections and as  
getright download manager softwares are exploited our bandwith. I want  
to limit connection per web-site and per-source IP's.
I hope so, I would explain more clearly


  Quoting "G.W. Haywood" <ged@jubileegroup.co.uk>:

> Hi there,
>
> On Sat, 5 Jan 2008, Umut Arus wrote:
>
>> We want to limiting httpd outgoing traffic in a proxy server,
>
> Do you mean "httpd outgoing traffic" or "HTTP outgoing traffic"?
>
>> in the scenario, one user should be connects to one web site (one IP)
>> in limited connection (for example max. 10).
>
> You are thinking of it in the way the user of a Web browser thinks of
> it.  Read about how HTTP traffic works.  After a single HTTP request
> has been processed, the TCP connection may no longer exist - although
> the user may still be reading a page fron the Website to which he sent
> the request.
>
> You need to make your objective clearer before you propose a solution,
> and give more information.  For example, how many users will there be?
> How much traffic will they generate, expressed both as connections and
> as bytes per unit time?  Will the limits be fixed or variable?  Do you
> not care about incoming traffic at all?  Do the connection limits only
> apply to simultaneous connections or to connections within some time?
>
>> I don't think that requirement does not meet with --connlimit-above
>> parameter. Am I wrong?
>
> I'm not sure exactly what that sentence means, so I don't know if it's
> wrong. :)  But I do not think that you will be able to do what you want
> to do in the way that you propose.
>
>> Is it possible to type a rule with ipfilter command?
>
> I do not know of an 'ipfilter' command.  Perhaps you need to see
>
> http://coombs.anu.edu.au/ipfilter/
>
> which has no connection with iptables.
>
> --
>
> 73,
> Ged.
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


