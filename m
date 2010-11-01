From: Robert Pipca <robertpipca@gmail.com>
Subject: Re-route non-http traffic
Date: Mon, 1 Nov 2010 00:51:13 -0200
Message-ID: <AANLkTi=GvwtxOLtFH9444aqdudrkUbaPdYQ63ZrUTH2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Ak+fS4T4k8sFFWg09nCIQA+rjq33NjTP4ENHLZdKw3Y=;
        b=ZQHWEdnktBLIhy64z8vMcEUvox6QWNXxk+mr3wTzCLy8n7WD/+vvvpH+Yu2f9x6Wvt
         Ad9ehp2wem6zZPAmDkblg52piqMlAeSIRYPrVUDAwW2XJME7Vyhlp7OnltXvOEG0e3c9
         0K8OCFGOSk1DKykvOwOO2cwmzoIjlpbgSJSR0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm using squid as a webcache in bridge-mode.

I use ebtables on tcp/80 to get the http traffic.

The thing is: this is an ISP, so some clients are companies that use
tcp/80 to non-http traffic (proprietary protocols mostly, eg.
biometric identification machines on a medical institution, for
instance).

So my question is: Since I can know what's the dst IP when the
connection arrives on netfilter, can I do something like:

"redirect this to the squid port, but save the destination IP".

If squid sees this is not http-traffic, sends the connection to _that_
saved destination IP...and everybody is happy.

Is it possible currently? Or is some coding necessary? We can help with that..

Please cc me on replies, please.

Thanks!

- Robert
