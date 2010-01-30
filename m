From: Susant Sahani <ssahani@gmail.com>
Subject: NF_STOLEN and reinsert in to IP stack
Date: Sat, 30 Jan 2010 14:27:18 +0530
Message-ID: <d81115a61001300057m37670c2bq45b740ec0a2aa34@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type;
        bh=2veMBjvhRdfG8Z8Ercyiq0ifEVXa4cc9eR6sWe1PDSk=;
        b=qNDEHYNKA6iidsJuLBI/RA43+kjG9KgB/aPzII2B59kPJMDR6+JpN1PHQW+qBWweEM
         aii7aeQgEky8ABevsAdmkHw7q2WSxOgrWPCj5DPSGZaxzC9TfKX9GosJLkrWEEcStu9U
         NCpKWvBk6OVs4NA8XOlYdKQWb/4NOFw5twgWs=
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@lists.netfilter.org, netfilter@vger.kernel.org, netdev@vger.kernel.org

Hi,

I have yet to find any resource that answers this question.  If I have
a kernel module that registers a callback with netfilter and steals a
packet during the NF_IP_PRE_ROUTING stage, How can I re-insert this

packet on the network stack, (before the ip routing stage) so it is
forwarded back out on the correct device?

susant

Charles de Gaulle  - "The better I get to know men, the more I find
myself loving dogs." -
http://www.brainyquote.com/quotes/authors/c/charles_de_gaulle.html
