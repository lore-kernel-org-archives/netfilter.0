From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: ebtables vlan captive portal
Date: Thu, 12 Mar 2015 12:27:27 +0100
Message-ID: <CAOkSjBgGu80ajXEE3Z3GWfXOjn3BcpBKAt=XevswvsshV+y7TQ@mail.gmail.com>
References: <e83b24aadd74fe6ca9f82d7d4a38de82@ezelink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=evqnStc4kYjukXtSsyCS2ghBLFFVYzg4vsVE34vQFX0=;
        b=H1UmmnbV/PaIpMzG91vi0ftJb4fOgPMfTQhSQns23D1XzcXphIPbMVeMdPKs0qkDQE
         5uU7pEetvusCyPUwKLDrMwPhhLzDEZFcxsBx78kv4IM1tB8giyDqp3sQ7sxbRlAOjuBu
         ZlWvVznhJmNN19OWplOqersvwi7CYsIy49xhWaVoHmquYIdw3CyPL2+bwkMYc89x9ksK
         FfWD2mJxJ6+8IcbmNSM/SyM61YXPysPgWjN0Nwd+IkzEWMG1bOfq6vdw+yk0ea9dKhrF
         Yeiuatkl7f6l8hjnRv0pOTV0YAPcddOMvUeH+uCCH43i6SX1DDalkE2wuccDodHM9MMv
         3/sQ==
In-Reply-To: <e83b24aadd74fe6ca9f82d7d4a38de82@ezelink.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: danny@ezelink.com
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 12 March 2015 at 04:39,  <danny@ezelink.com> wrote:
> http://s16.postimg.org/e5nu6g1md/bridgevlancaptive.png
>
> The above image link is based on my project about captive portal. As =
you can
> see on the image i have a diagram on LEFT side which is WORKING witho=
ut a
> problem on a normal scenario without any vlan.
>
> On RIGHT side however, it is similar to the setup on left side but it=
 is
> with multiple VLAN.
>
> I am having difficulties on finding the solution on this. need your i=
nput.
>
> Currently im looking at ebtables form the link
>

If you're planning a new project based on ebtables, would you consider
taking a look into nftables?

best regards.
--=20
Arturo Borrero Gonz=C3=A1lez
