From: Jeff Jensen <jjensen@unyalli.com>
Subject: Re: explanation of the syslog LEN and WINDOW entries
Date: Fri, 30 Oct 2009 08:15:49 -0600
Message-ID: <b376a78e0910300715q67dca354x46ea44eda213114f@mail.gmail.com>
References: <b376a78e0910280653y6312fc63yb2d20414d76a1ce0@mail.gmail.com>
	 <56378e320910280720q79cd3dma8eee31f3512a6c0@mail.gmail.com>
	 <b376a78e0910280756h4ba10f1oea023c6b870fe0cb@mail.gmail.com>
	 <4AE864BD.5080508@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AE864BD.5080508@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: John Haxby <john.haxby@oracle.com>, netfilter@vger.kernel.org

Thank You John, was not thinking this direction at all. After reading
many articles found by google on this search criteria let me ask
another question please.

Currently I don't use user created chains. Don't like em makes the
script hard to follow. If I re-train my entire thought process to use
user created chains could I get per protocol stats? For instance if I
had an FTP chain could I get an hourly total used by FTP? This would
be a total of control channel, active data channel, and passive data
channel.




On Wed, Oct 28, 2009 at 9:35 AM, John Haxby <john.haxby@oracle.com> wro=
te:
>
> On 28/10/09 14:56, Jeff Jensen wrote:
>>
>> The boss wants to know how much bandwidth is used by the different
>> app's we allow. I have some unique app's that run on unique port(s)
>> and rules that log all packets. I set the --log-prefix=3D to somethi=
ng
>> unique to that app and every day sort it out into individual files. =
I
>> was hoping to aggregate all the entries to a total bandwidth out and
>> it.
>>
>
> I do this slightly differently. =C2=A0 I collect information on a per=
-IP address basis (this is all traffic flowing through a router) and wi=
thin each table I have rows that match a particular port/protocol and t=
hen just -j RETURN.
>
> Every hour I run "iptables -vxnL <table> -Z" for each table and then =
merge the counters into a database. =C2=A0I have another process that p=
eriodically looks at the database and produces pretty graphs of the per=
-machine, per-protocol usage. =C2=A0(Well, actually, I haven't done per=
-protocol yet, but I have the information needed.)
>
> There's an accounting extension in xtables which would do the job bet=
ter, but I haven't attempted to persuade the xtables on CentOS 5 :-)
>
> jch
