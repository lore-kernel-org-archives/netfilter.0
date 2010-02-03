From: forbiddentransition <forbiddentransition@gmail.com>
Subject: iptables list command with very verbose option generates `ERROR'
 [64]
Date: Wed, 03 Feb 2010 13:42:10 -0500
Message-ID: <4B69C382.4020301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=5nk4scujX/cfIwPYoGiT9yY9i11Wzjl6hyStTFOJQko=;
        b=KzOZmEUNwEdihy5wLL3w3pPG2WX3GnsGCHCcLEIeq9K5I4GYNmspR6v3uLEiIT4oHA
         GabcjWR5KfEEcaZ8XA7HeopcOvUB6FqtfkG1CZxPInFrfFyFwJnRmYQRV9pEuK/JL1vO
         hqITAuTeJT219KLTUmnNncghRcxurIG184z1Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Can someone explain the meaning of  "Target name: `ERROR' [64]"?  The 
error is generated from running the iptables list command with the 'very 
verbose' option for every custom 'Target name' used in my iptables 
script.  Two blocks from the output are shown below with the errors 
highlighted by the arrows.  I have a basic understanding of iptables, 
though I haven't seen any documentation that details the 'very verbose' 
output.  I have googled "Target name: `ERROR' [64]" and it appears the 
last block containing "error='ERROR'" is commonly generated from other 
customized scripts, though I haven't seen any mention or concern about 
the error message.  In any case, my custom script appears to function 
properly.  Any help is appreciated.

iptables -Ln -vv

=========================OUTPUT=====================
.
.
.
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
Flags: 00
Invflags: 00
Counters: 0 packets, 0 bytes
Cache: 00000000
Target name: `ERROR' [64] <<<<<
error=`IN_ACC' <<<<<
.
.
.
SRC IP: 0.0.0.0/0.0.0.0 (LAST BLOCK)
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
Flags: 00
Invflags: 00
Counters: 0 packets, 0 bytes
Cache: 00000000
Target name: `ERROR' [64] <<<<<
error=`ERROR' <<<<<

=====================END OF OUTPUT==================
