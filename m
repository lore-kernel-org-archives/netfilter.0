From: <webman@manfbraun.de>
Subject: Configure conntrack and understand timestamp
Date: Sun, 12 Feb 2017 12:12:33 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAFK7h3ZgWDNHt5MtE3gECVIBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello !

My current work is around conntrack.
The first I've found is, that some
required configuration variables
are not set by default:

net.netfilter.nf_conntrack_acct =3D 1
net.netfilter.nf_conntrack_timestamp =3D 1

I added these to "/etc/sysctl.conf", but after
a reboot, these are NOT set. I am looking
for a workaround to set these variables.
I am on Debian Jessie 8.6 (3.16.0-4-amd64)
with conntrack 1.4.

The other point is to understand the timefield,
which you receive with "-o timestamp,ktimestamp":
[1486897660.578827]

What is this? If I translate the first part
to long and add it to 1970/0/0, I get a time,
which is about 5 minutes behind the reality.
Is is a double/float with decimal point?
Which unit it expresses? s/ms/=B5s/ns ??

If someone could shed some light onto this,
I would be happy.

Thanks anyway and best regards,
Manfred




