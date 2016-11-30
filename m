From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Programmatically adding Map element into the map/set using
 libnftnl
Date: Wed, 30 Nov 2016 23:32:57 +0100
Message-ID: <20161130223257.GA30644@salvia>
References: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
 <20161130193453.GA12643@salvia>
 <CAE0moycYr9ew0+2A38Z5jr=rUMEQ+JYKk1b0MX7sBQXyrmW5iA@mail.gmail.com>
 <20161130201434.GA24593@salvia>
 <20161130212725.GA2576@salvia>
 <CAE0moyeLhx0K_L_XSaehmSH5qGsezWiST_E9qWw0wUHn4hHezg@mail.gmail.com>
 <CAE0moydm75tcK=fTAXZQL8cWjTAAxTPv_69caEtT1swqFcA5iQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE0moydm75tcK=fTAXZQL8cWjTAAxTPv_69caEtT1swqFcA5iQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khawar Shehzad <shehzad.khawar@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Nov 30, 2016 at 10:28:04PM +0000, Khawar Shehzad wrote:
> Is there a way to flush all the elements in a set through command
> line? e.g. using command line as
> 
> ___________________________
> nft flush set ip6 my_table my_set

Not yet, I'm preparing a patchset for this. This has been requested
several time already. Will Cc you once they are ready.
