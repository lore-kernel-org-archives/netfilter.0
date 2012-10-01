From: Net Warrior <netwarrior863@gmail.com>
Subject: More that one not ! condition in a single rule.
Date: Mon, 1 Oct 2012 15:14:10 -0300
Message-ID: <CAP7y58PK9++n7ueLtQd8okKpqhhAeSBFYnO+JLeK60M-_Fqsbg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=OyWW2t4XXFGKMyR384G2Ds0dKVHtj+WbHj2qQuAL830=;
        b=a2fAHD3V77r91npi6fhAk7vhbZuSnHfWQWSwbyLgu8KfX4B9CLPyq61EaggW2IHWvD
         CguXgIxGModr7UbH2h2RpT2bXgcw8X6U2ZOu+Io0/u4k0zbghjqbnhO0sHbXOEf+0OGb
         dbCiASOFyvYGryaYETZCf1f5Gx7xsz6DV2yGqKYrsQhb6RWPln1Kjhd4hksTXurdkZ33
         0gdkvlcAbnnUVtDM6jOPtuCyM/yUq9OnyNqJCz7/gh0J8pVX8GAHFWnVtUAhDyFup62W
         DKdAuAFrI0jaKixkQen/sV/keHwCM616KEyYc1RzDMs1IlzOUqonkgAnLCt3uIDwY7+s
         7MkA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there.
Does anyone know if it's possible to include more than one ! not
clause in a single rule ?
I' have the following

IPTABLES -A AUDIT-RULE  -d $D_INT  ! -s x.x.x.x \
         -m limit --limit 10/s -j LOG \

I'd like to include other IP's, do I have to duplicate the sentence ?

Thanks for your time and support
Regards
