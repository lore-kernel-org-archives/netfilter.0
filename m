From: Loganaden Velvindron <loganaden@gmail.com>
Subject: Simple NFT example
Date: Thu, 30 Oct 2014 23:43:29 +0400
Message-ID: <CAOp4FwSrETzG=UUocA56zYbDjHb=tmuGQdMYq27UHe3eO01FvA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=C+3HvvzTfx9ZgYSnbkLfUjdJbDvZdW3dUKDLwuEZdAU=;
        b=LO0g2/CVT/XGT7D3b9GMGEAGuO5KDbPC0fweiq+9sKgv7meVrbp6I1GIa0t+itVawT
         a9GFP4tEPwDPwzRV1+ZrCikRBuM7Ok5baGBokPg3N8stVpIIHAkn5ZoHv5LerhzTAH3W
         OwVjv1Cay8q4+sbakcuD1ctVaSxsnPlEEtM1W0gWpVLP9aQJD71XT2YcIdMGUuIVPUyz
         RSO3Uno3YHSKP/ydKlXzmX3FMtqOpt2s/nVS3IMkqRW5ddM6mYT9O39a/iqkpHcNdnr9
         tffGaqiNdRuy7sEmi66rLEP5t5Crf1Wxm7QGn70glyleVstr4JWGZpd0yoyTVRdnV7Ex
         BxCQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys,

I tried to cook up a simple example.

Pablo sent me feedback on my example.

First we setup a basic table for IPv4.

table ip means that "ip" implicitly means IPv4.

The input chain is the "incoming" traffic on a machine. For example,
assuming that you have a desktop running SSH, and you would like to
have a simple ruleset which is suitable for a desktop. You'd want to
allow ping (so that you can ping your laptop on the network).

Some deamons bind to localhost interface. It's a good idea to accept
connections on local interface, so this should be allowed.

The rest is rejected.

For example, if your desktop runs a web server on port 80, it won't be
accessible. You need to enable it by adding another rule.

fw.basic:

table ip filter {
     chain input {

          type filter hook input priority 0;

          ct state established,related accept

          # accept connections for localhost interface
          iif lo accept

          # Accept SSH connections on port 22
          tcp dport 22 accept

          # Allow ICMP packets such as "ping"
          ip protocol icmp accept

          # Reject any other connections
          reject
     }
}


You can run this simply by typing:

nft -f fw.basic

Any feedback welcomed.

-- 
This message is strictly personal and the opinions expressed do not
represent those of my employers, either past or present.
