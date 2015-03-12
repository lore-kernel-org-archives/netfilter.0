From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: ebtables: ebtables-restore segfaults when 'among' list has many items
Date: Thu, 12 Mar 2015 12:24:42 +0100
Message-ID: <CAOkSjBgFfHSY8NmGfockjs-5FSni-69eMzFR2r0JY1Gr0UnuSQ@mail.gmail.com>
References: <2B1BE39E-516E-4C80-8137-553E21E5803C@gmail.com> <ED3912FE-6C60-4638-B38D-B68D600C7317@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=6ASwA+lgSJbKWmPXxYqM8ErgiuT7VR59z2IqMZzl/ZI=;
        b=px0S4No+LJPvwUtueFR3mhrOyGZ/F4lVTvmBlxa2nGZqUPgBTIan+C0aUm/v8g+MAW
         LENq/VAit/T3D8gsO6nERj1WfkWvLO7eS/qGwoCAensDt6XduFT40Nxo7Bg5b/dLbv7N
         EfNlvha6j3zPlaI6QyDG5JP6PxyCVP6guW3RKXcCr/HLuCEta8OBDXywozJgAqBXpZIA
         53sd2k+FiUY49y+nYXPF5ec9vwz+pf+vYs8yMWb57FJE2Ql8QMbBeoQTNe2vA/CAxkg5
         mOGQsPO09Z8np3F5lDklGxRbqvYGEwzFP66RQBpRci/wvy/8S9LSQG9znzs7pk2Dmqv2
         o0Nw==
In-Reply-To: <ED3912FE-6C60-4638-B38D-B68D600C7317@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Stuart Shelton <srcshelton@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 12 March 2015 at 01:11, Stuart Shelton <srcshelton@gmail.com> wrote:
>
> Right - I think I=E2=80=99ve fixed all of these=E2=80=A6
>

(Unrelated)

Would give a try to nftables? It would be interesting for us to see
how could you emulate the ebtables among extension with native
nftables mechanisms.

best regards.
--=20
Arturo Borrero Gonz=C3=A1lez
