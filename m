From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Documentation.
Date: Wed, 10 Jun 2020 13:55:18 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2006101320160.11442@piplus.local.jubileegroup.co.uk>
References: <alpine.DEB.2.21.2006061631470.11442@piplus.local.jubileegroup.co.uk> <20200607212347.GA24054@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=Cc:Date:From:From:In-Reply-To:Message-ID
        :MIME-Version:References:Reply-To:Subject:To:User-Agent; s=uk;
         bh=BWXmWQXxgPHLcb5hzZ0a4hRnaM+pZzJxX61gYlouugE=; b=qMTjrDuXD1sW
        DkPxMhS1fARc1PYmC3YDPaO2DKbOi2cD3IGqSJOGsHDUmQvxftOQm/SF4MZ4tPkY
        1UFlfuEcBE1K8RSwUnujtw88GYfhWINtDSn4Tw8mHynIcfkwQmbUlBcKYRKKqCAW
        nhduNy6W9+j8/9qblfAW7nCFzxgs/1UFxUkEhN3DzwqG3FwCtnM5Ls/xL3lqIhyr
        F1Ga1tKe1NxLuCtTMFW58LRku/bJc9RZbZ55cgHI1+X5yqMU3W0kfa23AXUSV4Tp
        /+ghpF5NR4v++G75JVMNSKM9wPAHWXR5ht0TlyBmk8y7RikxKVRWutHrG8tKmUPg
        c6KIgqpgsg==
In-Reply-To: <20200607212347.GA24054@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso via netfilter mailing list <netfilter@vger.kernel.org>

Hi there,

On Sun, 7 Jun 2020, Pablo Neira Ayuso wrote:
> On Sat, Jun 06, 2020 at 06:09:22PM +0100, G.W. Haywood wrote:
> [...]
>> Ideally I'd like to know which process ID is using which connection.
> [...]
> Probably you may use ulogd2 instead for this use-case? Use the NFLOG
> input driver which includes the process UID and GID. You could match
> on the first packet new packet based on the conntrack information.
> [...]

Thanks for the suggestion.  I've installed ulogd2, and I'm now logging
packet data to a Postgres database.  It seems that it will be useful,
but it doesn't immediately answer the question of which process ID is
using which connection.  The process UID and GID don't really help me,
because there may be hundreds of processes with the same values.  It's
the unique PID that I need.  I've trawled through the details for the
set of plugins [3] installed by Debian's ulogd2 package:

.../ulogd/ $ find . -type f | xargs -I '{}' ulogd -i '{}' | less

but I see nothing there which seems to fit.  Am I missing something?
A couple of other modules appeared in searches [2], but nothing which
seems designed for my purpose.  Is there a central module repository?

Looking at the documentation [1] of nfnetlink_queue I see that I might
be able to get something which has "a good chance"(!) of being the PID
that I need.  Ideally I'd like something better than good chance, but
if that's the best that can be done maybe I can live with it, or hack
a module which does what I want based on something which exists. :/

I have more documentation patches, is this a good place to send them,
or should I send them elsewhere, or use a bug-tracking system, or...?

[1] https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/comment-page-1/
[2] https://github.com/subfxnet/ulogd
[3]
ulogd_filter_HWHDR.so
ulogd_filter_IFINDEX.so
ulogd_filter_IP2BIN.so
ulogd_filter_IP2HBIN.so
ulogd_filter_IP2STR.so
ulogd_filter_MARK.so
ulogd_filter_PRINTFLOW.so
ulogd_filter_PRINTPKT.so
ulogd_filter_PWSNIFF.so
ulogd_inpflow_NFACCT.so
ulogd_inpflow_NFCT.so
ulogd_inppkt_NFLOG.so
ulogd_inppkt_ULOG.so
ulogd_inppkt_UNIXSOCK.so
ulogd_output_GPRINT.so
ulogd_output_GRAPHITE.so
ulogd_output_LOGEMU.so
ulogd_output_NACCT.so
ulogd_output_OPRINT.so
ulogd_output_PGSQL.so
ulogd_output_SYSLOG.so
ulogd_output_XML.so
ulogd_raw2packet_BASE.so

-- 

73,
Ged.
