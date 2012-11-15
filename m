From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Iptables rules with module string give strange counter results
Date: Thu, 15 Nov 2012 21:20:05 +0200
Message-ID: <50A54065.3050009@ngtech.co.il>
References: <CAAvRK96MCUh4XmeDVd8VU+P5_QvxO6D1_RYHxWBO6MPcOWCRKw@mail.gmail.com> <50A50EA7.6090001@ngtech.co.il> <CAAvRK96v8DLti4hJwYwpCQAe0OBHOgSJtRnps9Ltv6jW+8qqOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAvRK96v8DLti4hJwYwpCQAe0OBHOgSJtRnps9Ltv6jW+8qqOw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Budnev <vladimir.budnev@gmail.com>
Cc: netfilter@vger.kernel.org

On 11/15/2012 8:28 PM, Vladimir Budnev wrote:
> No, its casual server. Iron and ugly:)
> src host is ther server ip and the destination comes from browser
> loading gentoo.org
> Iv posted as simple example as could imagine and which illustrates
> situation. To avoid some misconfiguration with postrouting or
> prerouting or smth. It is just simple OUTPUT chain of filter table

I would say its understood why it will mark specific packets.
I have never used this module but it seems to me that you need to use 
some connection tracking\marking to make one match effect the whole 
connection.

Anyway Gentoo.org is not using index.php but xml...
net-filter it's logging by packets. and this is what a match means to me 
in the string sense of the *match*.

Regards,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
