From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 04:41:03 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101170351140.25976@obet.zrqbmnf.qr>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com> <alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr> <AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com> <alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr>
 <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben K <benkloester@gmail.com>
Cc: netfilter@vger.kernel.org, Pablo Neira Aysuo <pablo@netfilter.org>

On Monday 2011-01-17 03:44, Ben K wrote:

>> Matching across packets would incur unwanted complexity.
>
>Just curious, does the current string match implementation match
>across packets? If not, then surely adding replace functionality (with
>the same compromise) is not overly complex?

The string match does indeed not work across packets. I do not know why 
we have it, it won't have much use for stream protocols either and was 
probably devised for datagrams. I can't say for sure what the original 
authors' intentions were. xt_string also works on the entire IP packet, 
so there is a chance for false positives if one only wants to match 
actual L7 payload.
