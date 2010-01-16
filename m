From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: filtering based on MAC address prefix
Date: Sat, 16 Jan 2010 21:46:58 +0100
Message-ID: <20100116204658.GK5547@outback.rfc2324.org>
References: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com> <4B518D2A.2040905@caf.com.tr> <818423da1001160837w64e17f52y1958260aaca80155@mail.gmail.com> <4B51F2F8.5040704@caf.com.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B51F2F8.5040704@caf.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2010 Eray Aslan scripsit:

Hi!

> On 16.01.2010 18:37, Daniel Drake wrote:
> > At first glance it looks ideal, but after trying to get it working, it
> > seems inappropriate.
> > Setting all ebtables policies to DROP (and adding log rules) does
> > nothing. As far as I can tell, ebtables only operates on bridge
> > devices, of which there are none in this setup. Am I missing anything?

> Create a bridge with only one enslaved device and ebtables should see
> the traffic:
> http://ebtables.sourceforge.net/examples/basic.html#ex_nobridge

Is this wise on machines with high network load?
I would guess that it will slow down things a little. Am I wrong here?

Ciao
Max
-- 
If it doesn't work, force it.
If it breaks, it needed replacing anyway.
