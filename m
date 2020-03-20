From: Robert White <rwhite@pobox.com>
Subject: Interface group ID in flow tables?
Date: Fri, 20 Mar 2020 04:08:15 +0000
Message-ID: <3ed21862-ce8b-c70d-6e50-705efd46505c@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20180828_2048; t=1584677295;
        bh=Ph4VGkXsXRC0FDmYmxdHZGxQsycnKGIXIP+UvW9VQlo=;
        h=Received:Received:To:From:Subject:Message-ID:Date:MIME-Version:
         Content-Type;
        b=Ngfwi9jRYzdQ3BU7X8ZQ02Vtqor4SgSXROnFlc6x+1SLY0PJSchnPZDP4QqAb5rwt
         1sJ396rw3tkcA7szQkNOE2rRXJNGB2G20+eE2OCSY0vpmVV8RekUA3EEMBmWv8lBlj
         WF9MIC1dPl0BwosYACH+Id2GF96y/4gJ/69Mw1h8wFSIRJn8nQFojf+rUtXPnO/05Y
         z9LrjaSbBcA3e1Y4JrscuHE9pAYTUhQzte5A2PA8gUOMB4/QBoPdlTfnzqbhDO67d+
         cG6+66FjdpFq955q9UbetU60J11SIDG5QNHwneWndFVpRzxy796Awagb6UEG1S3jom
         MAP4rKbP9EFJg==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Right now flow tables use a set of devices to select the table structure.

It Would Be Nice=E2=84=A2 to be able to specify at least one group ID(s) ei=
ther=20
as a replacement for devices=3D or in addition to it, that would select=20
the candidate devices.

With a group id selector dynamic interfaces (ppp, ppoe, or the *.staN=20
interfaces created by hostapd on a 4addr segment) can come and go=20
without having to reload or update the set of active rules.

The structure of the running table doesn't change since each active=20
entry is still interface-to-interface, but the table building logic in=20
the accept stanza would include the group number check when needed.

