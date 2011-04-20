From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: iptables-save does not save correcly rateest bps parameter
Date: Wed, 20 Apr 2011 14:02:28 -0430
Message-ID: <1303324348.26585.5.camel@uqbar.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:content-type:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=DtUtsmcK6umpiRAQ0HK67gzoADSAsjrlkomIlOXmnvk=;
        b=t4hsYeS6qQNGNO9VE5cvjwU0Nie1oJ+32QYilXwmOkssqZrUdzebeFB5L7uiDGSEK5
         eZ3kOzHZIDxYza8WkcjuSFcM2klp3engkZF8vwhJ5iWSMxQ9q0EILX7JIJV3Ox6kJjyX
         SwmMFpv1mhnV64L6IFLJSlIoRnHMxizFOlAmA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have found something that may be a bug in iptables-save or in kernel
'rateest' code.

# iptables -t mangle -A Balance -m conntrack --ctstate NEW -m rateest
--rateest1 wan1meter --rateest-bps 1000kbit --rateest-bps1 1000kbit
--rateest-gt --rateest2 wan2meter --rateest-delta -j CONNMARK --set-mark
1

its corresponding line in iptables -L is:

CONNMARK   all  --  anywhere             anywhere            ctstate NEW
rateest match wan1meter delta bps 1000Kbit gt wan2meter delta bps
1000Kbit         CONNMARK set 0x1

so it seems to be right, but this line in iptables-save is:

-A Balance -m conntrack --ctstate NEW -m rateest --rateest1 wan1meter
--rateest-bps --rateest-gt --rateest2 wan2meter -j CONNMARK --set-xmark
0x1/0xffffffff

There is neither bps value nor delta parameter, so after
iptables-restore with the generated file, this iptables rule becames:

CONNMARK   all  --  anywhere             anywhere            ctstate NEW
rateest match wan1meter bps gt wan2meter bps CONNMARK set 0x1

I guess the bug is in iptables-save and not in the kernel but really I
don't know if the kernel honours these parameters.

(iptables version 1.4.10, Debian kernel 2.6.38-2-amd64)

