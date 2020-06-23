From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: [MAINTENANCE] Shutting down FTP services at netfilter.org
Date: Tue, 23 Jun 2020 12:37:21 +1000
Message-ID: <87o8pabj8e.fsf@goll.lan>
References: <20200603113712.GA24918@salvia> <20200603171621.GC717800@nataraja>
        <nycvar.YFH.7.77.849.2006032004220.24581@n3.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org

Jan Engelhardt <jengelh@inai.de> writes:

> On Wednesday 2020-06-03 19:16, Harald Welte wrote:
>>On Wed, Jun 03, 2020 at 01:37:12PM +0200, Pablo Neira Ayuso wrote:
>>> So netfilter.org will also be shutting down FTP services
>>
>> with HTTP there is no real convenient way to get directory listings
>> in a standardized / parseable format.
>
> There was convention, but no standard.

IIUC RFC 4918 (WebDAV) can, in principle, do this.
But it's awful so nobody does. :-)

I agree that rsync:// is the easy and obvious replacement for anon FTP
(when HTTP isn't sufficient).

