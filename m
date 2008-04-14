From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 14:10:08 -0500
Message-ID: <4803AC10.2000303@riverviewtech.net>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>  <4801622E.1060407@bofhland.org> <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com> <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr> <48030D4B.1040204@bofhland.org> <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr> <48033984.9060206@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48033984.9060206@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/14/08 06:01, whiplash wrote:
> Because I didn't know if the mentioned linux box was the default gateway 
> for the two XP boxes...:)

Regardless whether or not the Windows XP systems have routes to each 
others subnets or they use the default route, the Linux system has to be 
set up to allow IP Forwarding.  (I not recall having seen any thing 
indicating that the Linux box was indeed presently doing this.)

In other words, it is entirely possible for each XP system to get to the 
Linux system with out allowing routing between the two subnets / XP systems.



Grant. . . .
