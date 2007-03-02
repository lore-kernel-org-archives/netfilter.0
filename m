From: TheGesus <thegesus@gmail.com>
Subject: Re: redirect
Date: Fri, 2 Mar 2007 07:51:25 -0500
Message-ID: <5e70f6530703020451m4d5b6490m3c811787ebef557@mail.gmail.com>
References: <20070302074107.401q9rza8kwowwgs@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=VSnM8NDHwnEStkMbONZ13veE5NQrh9ys1DuLuUtpHZZqMv7SNp40lc2ojzCUyvQ+4C6VgpSwdiuURlpXmEMo+iOfNaKMAOVJC6x9Z4Ajn1qNbuNh5UoGYIhvLgOyiPmuMkY7DakWjoA03DtIsKz3Aq8myG9MjCIITEskRqiswPo=
In-Reply-To: <20070302074107.401q9rza8kwowwgs@mail.harrisonburg.k12.va.us>
Content-Disposition: inline
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
To: "dhottinger@harrisonburg.k12.va.us" <dhottinger@harrisonburg.k12.va.us>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

See below... apparently it's listening on port 95...

Not Found
The requested URL / was not found on this server.

--------------------------------------------------------------------------------

Apache/1.3.33 Server at swscan.apple.com Port 95

On 3/2/07, dhottinger@harrisonburg.k12.va.us
<dhottinger@harrisonburg.k12.va.us> wrote:
> I posted a question yesterday and I dont think I worded it very well.
> Im having problems with software updates on Apple computers.  I think
> it is an issue with my squid proxy server.  So I would like to make a
> rule set that says redirect all port 80 traffic except traffic going
> to apple.com's software update servers.  When connecting to apple
> software updates you connect to swscan.apple.com which downloads an
> xml file, then get redirected to an akamaitechnologies.com server for
> the downloads.  Im not quite certain yet why things are failing with
> my squid proxy server in the loop, but going around it lets the
> software updates work.  So, if any of the iptables gurus have a
> formula for this I would be very happy to try.
>
> thanks,
>
> ddh
>
>
> --
> Dwayne Hottinger
> Network Administrator
> Harrisonburg City Public Schools
>
>
>

