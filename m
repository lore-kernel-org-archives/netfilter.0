From: Peter Phaal <peter.phaal@gmail.com>
Subject: Re: Howto get ulog-prefix with ulogd-1.24 + sqlite3 backend?
Date: Wed, 13 Apr 2011 18:17:50 -0700
Message-ID: <BANLkTi=CnK0O2mmA-hQcgg14wQvxYQh=-w@mail.gmail.com>
References: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=m7HkspkWY2cZvnnDkZitaKRqJzsYQSB9J6dIELASkS0=;
        b=UgWXCbLrib5I/TZwMatYuKRHyIz24BvOhOycoHVNZt8Tu3NA0dYSFHBftmJIOOpDmA
         d0rDCqdZ2pTmZvhyNC2AFcDKpaEIh6EQQJATJm2jA5Qljt9Q1ZYzxC+ywZrXavOYZpSC
         m4HIO/K2txLSWfdBYAUoSQcY/DJtT48TRUe74=
In-Reply-To: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

You can significantly reduce the accounting load and improve
scalability by using packet sampling in the netfilter statistic
module. The Host sFlow daemon can be used as a ULOG monitor,
forwarding the packet samples as sFlow datagrams to a remote sFlow
collector, allowing centralized monitoring of large numbers of
servers.

=46or traffic accounting you might want to look at pmacct. pmacct can
receive sFlow from remote servers, or monitor ULOG locally, storing
the data in MySQL, PostgreSQL, SQLite or BerkeleyDB

See:
http://blog.sflow.com/2010/12/ulog.html
http://www.pmacct.net/

On Sat, Apr 9, 2011 at 5:13 AM, Clemens Eisserer <linuxhippy@gmail.com>=
 wrote:
> Hi,
>
> We try to use ulog for traffic accounting in an university project.
>
> First we tried ulogd-2.0beta4 + pgsql backend, but even under moderat=
e
> load the database couldn't keep pace with the amount of requests.
> I thought about using ulog2 with sqlite, however in TODO theres an
> entry about making ulogd2 compatible with squlite, so I guessed sqlit=
e
> is not yet supported with ulogd2?
>
> Then we switched back to ulog-1.24 + squlite3, which works perfectly.
> It can handle 100mbit/s torrent traffic at about ~50% CPU load.
> However in sqlite's ulog table, the ulog-prefix is not stored. Is
> there any way to get it stored - to be able to track which rule cause=
d
> the log enrty?
>
> Also, conntrack is supported in ulogd2. Is this also true for
> ulogd1.2? I couldn't find specific docs about that.
>
>
> Thank you in advance, Clemens
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
