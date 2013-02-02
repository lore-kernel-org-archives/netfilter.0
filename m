From: Al Grant <bigal.nz@gmail.com>
Subject: SMB over port fowards
Date: Sun, 3 Feb 2013 11:01:43 +1300
Message-ID: <CAODtcdeVYVBkkYd8yFY4ZoAcUvgd_xh6cvuaa7n400QjqffQCQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=dAuh2n26vUst8gP+pEdvK8XL/54FzWK/0Lre/0fZCNE=;
        b=DdaxNJs6MTP5C4W0dkl7gBTXhx9l96y78y45ZWGod6xMH28A/GyLwRT/zMmTS2Afxq
         lLAKmp3TOnCfz2E/lScKFA4GCFVZuYqftygD2znzngI12VF5vvxfyUQM3KkN/TrWzMhI
         k8vf0tA32uZacWpEwuP6tlf/p3YkVG5lWtWO1XOZOqEcf36IK1niFy6tw2y4g5861iu5
         ZhHxSFKMFK9GagiRf9/oM/zS64KSMdDuHyZvlFQagfepnEjne6eGdTAkh03IUp3632Tw
         cfEKgcOHb4K/bN0HGjjWvoRA+tUchmCSlBBsfA3eNoExtWDKpoAejGcH7Wf8zqDTYVlX
         RfTA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Guys,

I want to access a SMB share over a port forward in a Ubiquiti AirRouter.

The diagram here shows my setup:
https://www.dropbox.com/s/dt7q9owe5y997ug/Drawing1%20%282%29.jpg?m

The GUI in the airrouter when I made the port forwards created a DNAT
rule, but I think the src header in the packet still reflects a PC on
the wrong subnet (192.168.0.101).

Can I create a rule to change src header on SMB requests to the Air
Router 192.168.150.243 ?

What would the rule be?

Thanks in advance.

Al
