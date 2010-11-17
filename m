From: Kfir Lavi <lavi.kfir@gmail.com>
Subject: Automatic testing for eb,iptables rules?
Date: Wed, 17 Nov 2010 16:18:27 +0200
Message-ID: <AANLkTik1abcES-DRbefhYW0D4MZBwYBgNmvcVmZGkLmd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=aH5pdcHb6T0Co13hgKdrR0gAuc6JlkRYr8i+gr/9W3E=;
        b=HBW2yWqdv8TG6kMIpEx/E8Ob0wGAgSNqXc6AkbjV5ZH+XI2Ldf3x9Npy94CL8XjlZe
         tYIaJvQ4sMbkWl3Jv9ouCdyfaAqG7Q+Z5JNUsW4+TeYWKi4cNbh61fdn3RM0ybE1HXLJ
         v5iivjW4mP5uZtJNpBHSXlTqK0BGJFj3PPwLM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I have some simple rules I want to test.
It involves bridge and some iptables rules.
I want to have those tests in a script, and run the script locally.
What is the best way to do this tests? what tools to use?

By asking this question I try to avoid using multiple computers to
test the bridge-router.

I tried already using nemesis to create packets, but the bridge don't
see those packages.
The same happen with tcpreplay running locally.

Thanks,
Kfir
