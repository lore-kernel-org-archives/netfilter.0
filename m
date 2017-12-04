From: mat rowlands <mat@podulator.com>
Subject: netfilter, libiptc and QUEUEing
Date: Mon, 4 Dec 2017 00:32:07 +0000
Message-ID: <CAGgrGy92eqxoyN9jRCfehSjUK3TiLM0iJeKhD6v8OuqY+t=bag@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sgNBwiJ4rpzv3pBE2toyEfZp1EoMEECCmLlRD8BKzNY=;
        b=CXRlfn+3RRC0YcmC6wiwk9A7X17E1YpMGBSjJbYCSWbp2dUtq9/ZbFnKcq+xIhI8CK
         1eXswLjF3Pde9Xme4v1Wb9RR8C/a8rx3yUOE7ZEMXVqLXgM8EGsSPhi2xbUYxr4joJa9
         CcleK9E33SAk/FtZTM36qVuNzjNJU5ScbQz4IEUeJyEP3on7VSnrBZZ1klL+atP7TKNm
         szk+i3Bco9GbUiCaAyDXh0YQtYR7zf3CDkpdUWRr/j/zBVmqDT2MkRrQJZUoEwImP3Ys
         zQakucO/ADwTKlxi4q35YkVHMfFWrUslICd+sSpR18yNVSTRvIF6/6p7/7zzAQwPT0b8
         f1pg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi there,

i=E2=80=99m trying to emulate :: iptables -A INPUT -t filter -p tcp -j NFQU=
EUE
=E2=80=93queue-num $queueNum

where $queueNum is any int

so far I have

static int createFilters(int baseNumber) {

/*
* input filter looks like this
* iptables -A INPUT -t filter -p tcp -j NFQUEUE =E2=80=93queue-num 5
* sudo iptables -L INPUT
* Chain INPUT (policy ACCEPT)
* target prot opt source destination
* NFQUEUE tcp =E2=80=94 anywhere anywhere NFQUEUE num 5
*/
const char *table =3D =E2=80=9Cfilter=E2=80=9D;
const char *chain =3D =E2=80=9CINPUT=E2=80=9D;
const char *target =3D =E2=80=9CQUEUE=E2=80=9D;
struct
{
struct ipt_entry entry;
struct xt_NFQ_info {
u_int16_t queueNum;
} target;
} entry;
struct xtc_handle *h;
int ret =3D 1;

h =3D iptc_init (table);
if (!h) {
fprintf (stderr, =E2=80=9CCould not init IPTC library: %s\n=E2=80=9D, iptc_=
strerror (errno));
goto out;
}

memset (&entry, 0, sizeof (entry));
/* target */
entry.target.queueNum =3D XT_ALIGN (baseNumber);
entry.entry.target_offset =3D sizeof (struct ipt_entry);
entry.entry.next_offset =3D entry.entry.target_offset + sizeof(entry.target=
);

if (!iptc_append_entry (chain, (struct ipt_entry *) &entry, h)) {
fprintf (stderr, =E2=80=9CCould not insert a rule in iptables (table %s):
%s\n=E2=80=9D, table, iptc_strerror (errno));
goto out;
}

if (!iptc_commit (h)) {
fprintf (stderr, =E2=80=9CCould not commit changes in iptables (table %s):
%s\n=E2=80=9D, table, iptc_strerror (errno));
goto out;
}

ret =3D 0;

out:
if (h)
iptc_free (h);

return ret;
}

but it won=E2=80=99t commit. Any thoughts?
Thanks for any help,
Mat
