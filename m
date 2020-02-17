From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Difficulties with ulog / NFCT
Date: Mon, 17 Feb 2020 18:53:23 +0300
Message-ID: <CAEzD07JoH=KN4z0hN+UXqPr3AJW6cc3maVwMRZUcahSkfL+8WQ@mail.gmail.com>
References: <ef15f5cc-1fa3-fe40-3e5e-a463e3f95314@tana.it> <ee17e7ef-8e26-4062-5c2c-b666e9525d59@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=irZhJIpgNhbL+xCT1qlq2C8w/hQqvbj34mqffhmevg8=;
        b=cDf48IYB6bXfHYoRIiqaVmv51J6XnlMFDVAva3GOfBEzZQjDbdb+L+tQRzWHuSiq1O
         Ti4Jrtgcx+CYX7N4TWBPCJpnxnZGskctJbs6j/FKY3ZoPOP/hBNb7IVmGdU2HhLXBTSn
         xXjdWgKKxwwjq7jlLyGKHT3X0du2xHAxsb4S9aLb/cyul5E5t0gEfOQUgmy4fllTDXfQ
         7vc4Ok1DeI/hCofbGkQWDhkpXhGTVJDIU5pPwh8zL74aVGa0Pm2gEg9lRuU/DnLoIFjp
         HdqzyVAV/R4Rg8uOtDIgP6zVeQzaKtxxqDfhVT+TzRCd6VWhhH5KLTTajsAn1JRo3JSI
         Dgyg==
In-Reply-To: <ee17e7ef-8e26-4062-5c2c-b666e9525d59@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter <netfilter@vger.kernel.org>

Have you enabled the conntrack accounting and conntrack timestamps via sysc=
tl?

On Mon, 17 Feb 2020 at 18:13, Alessandro Vesely <vesely@tana.it> wrote:
>
> Hi,
>
> Only the start timestamp is NULL, the end one looks fine.  I tried settin=
g
> hash_enable=3D0, it apparently didn't better nor worse the logging.
>
>
> In /proc/net/nf_conntrack there is no timestamp, but port numbers seem go=
od
> (there is no port 32767).
>
>
> What am I missing?
>
> Best
> Ale
>
> On Sat 15/Feb/2020 17:03:19 +0100 Alessandro Vesely wrote:
> > I've set up logging as follows, to get a history of TCP connections:
> >
> > # conntrack logging to MariaDB
> > stack=3Dct1:NFCT,ip2str1:IP2STR,mysql1:MYSQL
> >
> > [ct1]
> > accept_proto_filter=3Dtcp # layer 4 proto of connections
> > event_mask=3D0x00000004 # only listen to DESTROY events
> >
> > [mysql1]
> > table=3D"ct"
> > reconnect=3D4
> > connect_timeout=3D60
> > procedure=3D"INSERT"
> > db=3D"ulog"
> > host=3D"localhost"
> > user=3D"ulog"
> > pass=3D"*****"
> > port=3D3306
> >
> >
> > It doesn't work well.  For example, I get this:
> >
> > MariaDB [ulog]> SELECT FROM_UNIXTIME(flow_start_sec) AS start, flow_end=
_sec - flow_start_sec AS sec,
> >> orig_ip_saddr_str AS src, orig_l4_sport AS sport, orig_ip_daddr_str, o=
rig_l4_dport AS svc
> >> FROM ct WHERE orig_ip_saddr_str =3D '66.110.216.209';
> > +-------+------+----------------+-------+-------------------+------+
> > | start | sec  | src            | sport | orig_ip_daddr_str | svc  |
> > +-------+------+----------------+-------+-------------------+------+
> > | NULL  | NULL | 66.110.216.209 | 32767 | 62.94.243.226     |  143 |
> > | NULL  | NULL | 66.110.216.209 | 32767 | 62.94.243.226     |  143 |
> > +-------+------+----------------+-------+-------------------+------+
> > 2 rows in set (0.00 sec)
> >
> >
> >
> > flow_start_sec and flow_end_sec are both NULL, after several hours.  Th=
ey seem to be non-NULL for outgoing connections and for connections coming =
from the internal network.  Even then, they don't seem to be accurate timin=
gs.
> >
> > The mail log for the IP above IP is as follows (the source port is alwa=
ys 32767):
> >
> > Feb 15 12:08:07 22 north imapd: LOGIN FAILED, user=3Dsungjtrio@fragolin=
e.it, ip=3D[66.110.216.209], port=3D[41204]
> > Feb 15 12:08:16 23 north imapd: Disconnected, ip=3D[66.110.216.209], po=
rt=3D[41204], time=3D16
> > Feb 15 12:08:47 23 north imapd: Connection, ip=3D[66.110.216.209], port=
=3D[45344]
> > Feb 15 12:08:54 22 north imapd: LOGIN FAILED, user=3Dsungjtrio@fragolin=
e.it, ip=3D[66.110.216.209], port=3D[45344]
> > Feb 15 12:09:06 23 north imapd: Disconnected, ip=3D[66.110.216.209], po=
rt=3D[45344], time=3D19
> >
> > Disconnections are likely caused by conntrack -D -s 66.110.216.209.  I'=
m reporting abusive login attempts at end-of-day, and I've been told to men=
tion my server (target) address and port, 62.94.243.226:143 in this case.  =
Since the mail log doesn't mention that data, the idea is to find it in the=
 NFCT log based on the time and source IP.
> >
> > Should I be running conntrackd?
> > Should I play with socket buffer/ resync timeout/ backlog_oneshot_reque=
sts/ ring_buffer_size?
> > Any other hint?
> >
> >
> > TIA
> > Ale
> >



--=20
Anton Danilov.
