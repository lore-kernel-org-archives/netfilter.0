From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Dose netfilter can intercept the http method like the GET and
 POST?
Date: Sat, 24 Apr 2010 00:35:04 -0500
Message-ID: <4BD28308.3010302@riverviewtech.net>
References: <m2w28efc0211004231920o2345ee66w3d39329cc73bad95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m2w28efc0211004231920o2345ee66w3d39329cc73bad95@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

supercodeing35271 supercodeing35271 wrote:
> Hi,i just think about that does netfilter could doing a Application 
> Layer protection. Assume there is a website which the server is 
> Apache/Tomcat,and the browser just submit the http/jsp form which 
> contains a malicious string for SQL or XSS attack.Now the netfilter 
> program in the website server get the string before send to Tomcat 
> and check the string. So does this could be done?And how to do it by 
> netfilter?

NetFilter does have some layer 7 capabilities that can be used to do 
this.  However, it will be difficult (at best?) to do it very well.

I think you would be far better off using some sort of reverse proxy 
that is meant to work at the application layer.  I.e. Squid, or Apache, 
or Nginx, or the likes.

For NetFilter to be able to do what you are wanting, you will have to 
possibly deal with fragmented packets designed to thwart filtering like 
you want to do.

Where as with an application layer gateway / reverse proxy, it will 
receive the request, re-assemble it, run a sanity check on it (against 
rules that you can easily define) and then pass only the valid requests 
on in to your back end web server.



Grant. . . .
