From: <konrad.vrba@gmail.com>
Subject: using "recent" module to prevent port scanning
Date: Sat, 18 May 2013 10:09:45 +0200
Message-ID: <e11b81fc-e140-441e-812e-cfec74990113@edge10s.ethz.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear list, 
I am using the "recent" module to prevent port scanning, such as:

    -A INPUT -i eth0 -m recent --name PORTSCAN --update --seconds 60 -j DROP
    -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
    -A INPUT         -m recent --name PORTSCAN --set -j DROP

The --update option, contrary to its name (ie, update old value with new one), does not update the last-seen entry, but rather adds another one. In my simple setup, I am only interested in the last entry. I dont need the whole history of packets seen.

 Is there a way, I could only keep the last seen packet ? There used to be an option --reap, to delete entries older than "seconds", but AFAIK has been removed.

My concern is, that on a busy server, the PORTSCAN list could quickly grow pretty large. I dont know what the limit is, but I am sure there must be some limit. 

could somebody please advise?
