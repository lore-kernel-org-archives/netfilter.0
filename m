From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: helper match bug?
Date: Thu, 11 Oct 2012 19:15:47 -0500
Message-ID: <20121012001547.GY3672@harrier.slackbuilds.org>
References: <5076D333020000E200012986@tempegwia1.comtechefdata.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5076D333020000E200012986@tempegwia1.comtechefdata.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Oct 11, 2012 at 12:09:55PM -0700, Brian Morris wrote:
> It seems the helper match shouldn't succeed if the strings being
> compared aren't the same length.
>  
> For example, both of these nat rules match the helper connections 
> if I start an FTP session on master port 212 with FTP conntrack 
> configured to support both ports:
>  
> -A PREROUTING -p tcp -m state --state RELATED -m helper --helper
> "ftp-212" 
> -A PREROUTING -p tcp -m state --state RELATED -m helper --helper
> "ftp-2122" 
>  
> because the strncmp is just using the length of the helper. Is
> this by design?

The nat table only sees -m state --state (or preferred, -m conntrack 
--ctstate) NEW packets. You have restricted your rule to match 
packets which will never reach that table/chain.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
