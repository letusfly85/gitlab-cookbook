GitLab Cookbook
===============
GitLabの環境を量産するためのRecipeセットを目指します。

Setup
===============
debファイルが100MBを超過してgithubにはアップ出来ないので下記コマンドで事前取得する
```shell
wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.2-omnibus-1_amd64.deb -O files/default/gitlab_7.4.2-omnibus-1_amd64.deb
```

TODO
===============
下記サイトを参照し、git-dataをebs管理、s3バックアップするようにレシピを変更
https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.m://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.md



Requirements
------------
本RecipeのGitLabはUbuntu14.04で動作することを目的としています。
また、git, mysql, rubyがインストールされている必要があります。

#### packages
- `ruby` - gitlab needs ruby version 2.1.3

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### gitlab::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gitlab']['external_url']</tt></td>
    <td>String</td>
    <td>gitlabを提供するURL</td>
    <td align=center><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>['gitlab']['db_host']</tt></td>
    <td>String</td>
    <td>databaseのエンドポイント</td>
    <td align=center><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>['gitlab']['db_port']</tt></td>
    <td>String</td>
    <td>databaseのポート</td>
    <td align=center><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>['gitlab']['db_username']</tt></td>
    <td>String</td>
    <td>databaseのユーザ名</td>
    <td align=center><tt>-</tt></td>
  </tr>
  <tr>
    <td><tt>['gitlab']['db_password']</tt></td>
    <td>String</td>
    <td>databaseのパスワード</td>
    <td align=center><tt>-</tt></td>
  </tr>
</table>

Usage
-----
#### gitlab::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `gitlab` in your node's `run_list`:

```json
{
  "run_list": [
		  "recipe[gitlab]"
  ],
  "automatic": {
    "ipaddress": "XX.XX.XX.XX"
  },
  "gitlab": {
    "external_url": "XX.XX.XX.XX",
	"db_host": "your end point",
	"db_port": "your port",
	"db_username": "git, for example",
	"db_password": "git password"
  }
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Shunsuke Wada
