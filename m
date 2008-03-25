From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 12:35:49 -0500
Message-ID: <47E937F5.9050300@riverviewtech.net>
References: <47E913B6.4080004@tssg.org> <47E92B5A.5030903@riverviewtech.net> <47E93099.9010602@tssg.org> <47E93762.4040107@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E93762.4040107@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/25/08 12:33, Taylor, Grant wrote:
> I would like to see developers write their applications with 
> documentation (be it auto generated or not) that indicates what type of 
> traffic (and parameters there on) they expect to see and need to 
> function correctly.  I'd like to then take said documentation and use it 
> to build rules for a simple ALG that will pass any valid requests in to 
> the back end application while correctly handling erroneous traffic.  I 
> think said ALGs could easily function as a proxy with some simple rules 
> as to what is and is not allowed to pass through the ALG.

Note:  I don't think that the rules for the ALG should be auto generated 
on demand from the original code or class as this will be a performance 
hit for systems.  These rules need to be defined in a batch operation. 
Now that batch operation could load the back end class and call a method 
that will return what it is expecting to dynamically build the rules 
once a night or when ever things are updated.



Grant. . . .
